## 
## ARSENAL installer
## 
## v0.3 - 24/01/2016
## 

## Variables
$arsenal_dir = $($env:USERPROFILE)+"\Desktop\Arsenal"
$temp_dir = $($env:TEMP)+"\Arsenal"
$menu_group = "Arsenal"

New-Item -ItemType Directory -Force -Path $arsenal_dir | out-null
New-Item -ItemType Directory -Force -Path $temp_dir | out-null
Unblock-File -Path $temp_dir

## Software FLAG - Choice
if($env:arsenal_key) { $software_flag = "0x"+$($env:arsenal_key); }
else { $software_flag = "0x0002"; }

## Software List
#   FLAG = " Name ; Desc ; Category ; Url ; Install/Unzip/Move ; Exec_Params ";
$software = @{
	0x0001 = "OllyDbg;Windows debugger;debug;http://www.ollydbg.de/odbg201.zip;1;OllyDbg";
	0x0002 = "Putty;SSH and telnet client;utils;http://the.earth.li/~sgtatham/putty/latest/x86/putty-0.66-installer.exe;0;/SP- /SILENT /NORESTART /GROUP=$menu_group";
	0x0004 = "FGDump;Tool for mass password auditing of Windows systems;passwords;http://www.foofus.net/fizzgig/fgdump/fgdump-2.1.0-exeonly.zip;1;FGDump";
	0x0008 = "FocaPro;Tool to find metadata and hidden information online;metadata;https://www.elevenpaths.com/downloads/FocaPro.zip;1;FocaPro";
	0x0010 = "Hashcat;Advanced password recovery tool;passwords;http://hashcat.net/files/hashcat-2.00.7z;2;.\Hashcat";
	0x0020 = "oclHashcat AMD;GPGPU advanced password recovery tool;passwords;http://hashcat.net/files/oclHashcat-2.01.7z;2;.\Hashcat";
	0x0040 = "oclHashcat NVidia;GPGPU advanced password recovery tool;passwords;http://hashcat.net/files/cudaHashcat-2.01.7z;2;.\Hashcat";
	0x0080 = "HashcatGUI;Hashcat GUI;passwords;https://hashkiller.co.uk/downloads/HashcatGUI_045.zip;1;Hashcat";
	0x0100 = "Sysinternals Suite;PSTools and Troubleshooting Utilities for Windows;utils;https://download.sysinternals.com/files/sysinternalssuite.zip;1;PSTools";
	0x0200 = "Win10Pcap;New WinPcap-based Ethernet packet capture library;network;http://www.win10pcap.org/download/Win10Pcap-v10.2-5002.msi;0;/PASSIVE /NORESTART";
	0x0400 = "Wireshark;Network protocol analyzer;network;https://1.eu.dl.wireshark.org/win32/Wireshark-win32-2.0.1.exe;0;/NCRC /S";
	0x0800 = "Cain & Abel;Password recovery tool;passwords;http://www.oxid.it/downloads/ca_setup.exe;0;/S";
	0x1000 = "Ophcrack;Windows password cracker based on rainbow tables;passwords;http://downloads.sourceforge.net/project/ophcrack/ophcrack/3.6.0/ophcrack-win32-installer-3.6.0.exe?r=&ts=1453409572&use_mirror=heanet&name=/ophcrack-win32-installer-3.6.0.exe;0;/S /NCRC";
	0x2000 = "GNS3;Graphical Network Simulator. It allows simulate complex networks;virtualization;https://github.com/GNS3/gns3-gui/releases/download/v1.3.13/GNS3-1.3.13-all-in-one.exe;0;/S /NCRC";
	0x4000 = "HashCheck;HashCheck Shell Extension;utils;http://code.kliu.org/hashcheck/downloads/HashCheckInstall-latest.exe;0;/S /NCRC";
	0x8000 = "WinPcap ;WinPcap ;network;http://www.winpcap.org/install/bin/WinPcap_4_1_3.exe;0;/S /NCRC";
	0x10000 = "HeidiSQL;Client for MySQL, MSQL & PostgreSQL;utils;http://www.heidisql.com/installers/HeidiSQL_9.3.0.4984_Setup.exe;0;/sp- /silent /norestart";
	0x20000 = "Linux Reader;Read Ext2/Ext3/Ext4, HFS and ReiserFS file systems.;utils;http://www.diskinternals.com/download/Linux_Reader.exe;0;/S /NCRC";
	0x40000 = "Pestudio;Performs Malware Initial Assessment of any executable file;debug;https://www.winitor.com/tools/pestudio851.zip;1;pestudio";
	0x80000 = "Nmap;Utility for network discovery and security auditing;network;https://nmap.org/dist/nmap-7.01-setup.exe;0;/S /NCRC";
	0x100000 = "VirtualBox;Desktop virtualization;virtualization;http://download.virtualbox.org/virtualbox/5.0.14/VirtualBox-5.0.14-105127-Win.exe;0;/S /NCRC";
	0x200000 = "VMware Player;Desktop virtualization;virtualization;https://download3.vmware.com/software/player/file/VMware-player-12.1.0-3272444.exe;0;/S /NCRC";
	0x400000 = "NetworkMiner;Network Forensic Analysis Tool;network;https://www.netresec.com/?download=NetworkMiner&name=/NetworkMiner_2-0.zip;1;NetworkMiner";
	0x800000 = "Posh-SecMod;PowerShell Module with Security cmdlets for security work;powershell;https://github.com/darkoperator/Posh-SecMod/archive/master.zip;1;Posh-SecMod";
	0x1000000 = "RWMC;PowerShell mimikatz;powershell;https://github.com/giMini/RWMC/archive/master.zip;1;RWMC";
	0x2000000 = "Mimikatz;Dump cleartext passwords;passwords;https://github.com/gentilkiwi/mimikatz/releases/download/2.1.0-alpha-20160217/mimikatz_trunk.zip;1;mimikatz";
	}
$software_list=$software.Keys | where { $_ -band $software_flag } | Sort-Object $_.Keys| foreach { $software.Get_Item($_) }

## Banner
Write-Host " "
Write-Host "     \                                    |      " -ForegroundColor Magenta
Write-Host "    _ \     __|  __|   _ \  __ \    _`` |  |      " -ForegroundColor Magenta
Write-Host "   ___ \   |   \__ \   __/  |   |  (   |  |      " -ForegroundColor Magenta
Write-Host " _/    _\ _|   ____/ \___| _|  _| \__,_| _|      " -ForegroundColor Magenta
Write-Host "                     |           |  |            " -ForegroundColor Magenta
Write-Host "     |  __ \    __|  __|   _`` |  |  |   _ \   __|" -ForegroundColor Magenta
Write-Host "     |  |   | \__ \  |    (   |  |  |   __/  |   " -ForegroundColor Magenta
Write-Host "    _| _|  _| ____/ \__| \__,_| _| _| \___| _|" -ForegroundColor Magenta
Write-Host " "
Write-Host "       Pentesting Utilities Installer" -ForegroundColor Gray
Write-Host "       by belane " -ForegroundColor Gray
Write-Host " "

## List Loop
write-host `#`# Package List -ForegroundColor Yellow
foreach($package in $software_list)
    {
    write-host - $package.Split(";")[0]
    }
write-host `n 10 seconds to go -ForegroundColor DarkGray
Start-Sleep -s 10

## Install Loop
foreach($package in $software_list)
    {
    # Package details
    $package = $package.Split(";")
    $name = $package[0]
    $desc = $package[1]
    $category = $package[2]
    $url = $package[3]
    $install_or_unzip = $package[4]
    $exec_params = $package[5]
    
    # Start
    write-host 
    write-host `#`# $name `| $desc -ForegroundColor Green
    
    ## Donwload
    $web_client = New-Object System.Net.WebClient
    Write-Host "Downloading $name"
    $temp_file = "$temp_dir\$($url.split("/")[-1])"
    $web_client.DownloadFile($url,$temp_file)

    ## Install/Unzip/Move
    Unblock-File $temp_file
    switch ($install_or_unzip) 
        { 
            # Unzip & Move
            1 {
                $shell_app=new-object -com shell.application
                $zip_file = $shell_app.namespace($temp_file)
                Write-Host "Uncompressing..."
                New-Item -ItemType Directory -Force -Path $arsenal_dir\$exec_params | out-null
                $destination = $shell_app.namespace("$arsenal_dir\$exec_params")
                $destination.Copyhere($zip_file.items(), 0x10)
                }
            # Move
            2 { 
                New-Item -ItemType Directory -Force -Path $arsenal_dir\$exec_params | out-null
                Write-Host "Moving..."
                move-item $temp_file $arsenal_dir\$exec_params
                } 
            # Execute
            default {
                $exec = New-Object -com shell.application
                Write-Host "Installing..."
                $exec.shellexecute($temp_file, $exec_params)
                }
        }
    }

write-host 
write-host DONE! -ForegroundColor Green
