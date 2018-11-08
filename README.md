# xtevedocker for Linux Ubuntu (Editable Version) 1.2.1
https://github.com/MCTyler/xtevedocker/archive/master.zip
# If you would like your own version of XTeVe, just replace the Binary with your own.
# Edit the Run Script to Suit your Needs for Port.
# To Build this Volume, Download Repo Zip, and run:

`docker build /path/to/extracted/repo`

# This Docker Container can bun run with the following command:

`docker run -it --network host --restart always --name xtevedock -v ~/xtevedock/tmp:/tmp/xteve/ -v ~/xtevedock/files:/root/xteve/` {first 4 #'s of the Build you just made}
