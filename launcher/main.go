// BusVoice — портативный запуск: находит рядом с собой папку python\ и busvoice.py,
// запускает pythonw.exe без окна консоли. Ничего не качает, ничего не пишет в реестр.
package main

import (
	"os"
	"os/exec"
	"path/filepath"
	"syscall"
)

func main() {
	exe, err := os.Executable()
	if err != nil {
		return
	}
	dir := filepath.Dir(exe)
	py := filepath.Join(dir, "python", "pythonw.exe")
	script := filepath.Join(dir, "busvoice.py")
	if _, err := os.Stat(py); err != nil {
		return
	}
	cmd := exec.Command(py, script)
	cmd.Dir = dir
	cmd.SysProcAttr = &syscall.SysProcAttr{HideWindow: true, CreationFlags: 0x00000008} // DETACHED_PROCESS
	_ = cmd.Start()
}
