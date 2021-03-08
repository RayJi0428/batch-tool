import subprocess
print subprocess.Popen("echo %s " % user_input, stdout=PIPE).stdout.read()
import os
os.system()