import subprocess
import sys

def main(params):
    if not len(params) == 2:
        return

    # get battery num
    batteryNum = params[1]

    # get all battery data
    bashCommand = "acpi"
    process = subprocess.Popen(bashCommand.split(), stdout=subprocess.PIPE)
    output, error = process.communicate()
    batteryStatus = output.splitlines()

    # parse corresponding battery info
    if batteryNum == "0":
        batteryInfo = str(batteryStatus[0])

    elif batteryNum == "1":
        batteryInfo = str(batteryStatus[1])

    return batteryInfo[2:-1] # -1 because ' at end of string

if __name__ == '__main__':
    res = main(sys.argv)
    sys.stderr.write(res + "\n")
