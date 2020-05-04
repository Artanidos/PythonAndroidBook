#Deploying to Linux
On Linux, Windows and MacOS I prefer to use another tool called **PyInstaller** because it resolves all dependencies automatically.  
To create a setup program I prefer to use the **QtInstallerFramework** delivered with Qt, because it is also cross platform and free to use.

##Install PyInstaller
You can download PyInstaller using pip.

```console
user@machine:/path$ pip3 install pyinstaller
```
PyInstaller bundles a Python application and all its dependencies into a single package. The user can run the packaged app without installing a Python interpreter or any modules.

##Install QtInstallerFramework
Now we also need Qt. You can download it here: [https://www.qt.io/download](https://www.qt.io/download).
You should install the following components.   
![installer](../images/installer.png "installer")  
If there is no option for version 3.1 (Windows) then 3.0 will do also. 


##Build Executable
To create a package just run pyinstaller with the main python module as argument.
```console
user@machine:/path$ pyinstaller main.py
```

##Test Executable
You can then test the compiled application running:
```console 
user@machine:/path$ dist/main/main
```

Theoretically you can now zip all files inside the dist/main directory, but I prefer to build a setup program which you may upload as a single file and therefore we use the QtInstallerFramework now.

##Create Setup Package
Therefor we first create a folder named config.  
Inside the config folder we now create a file named *config.xml*.  
```xml
<?xml version="1.0" encoding="UTF-8"?>
  <Installer>
      <Name>DemoApplication</Name>
      <Version>1.0.0</Version>
      <Title>DemoApplication</Title>
      <Publisher>Publisher</Publisher>
      <StartMenuDir></StartMenuDir>
      <TargetDir>@HomeDir@/DemoApplication</TargetDir>
      <Translations>
        <Translation>en.qm</Translation>
    </Translations>
  </Installer>
```
Fill in the following fields as follows:  

| Field | Value |
|  ---     |   ---     |
|  Name   |   Name of the application     |
|  Version   |   Version of the application    |
|  Title   |   Name of the application    |
|  Publisher   |   Your name / your company name    |
|  TargetDir   |   Default install location    |
|  Translation   |   Langage code of you application    |

If you do not specify a language then Qt is taking the language of the operation system which is not always the best choice. In my case the OS is set to German but all of my application are written in English language.

Now we create a folder named *packages* and inside of this folder another folder with the name *com.vendor.product*. Inside of this directory we create a folder named *data* where we will copy all the binaries later and a folder named *meta*. Inside the meta folder we are creating a new file named *package.xml* with the following content:  
```xml
<?xml version="1.0" encoding="UTF-8"?>
  <Package>
      <DisplayName>DemoApplication</DisplayName>
      <Description>Install this application.</Description>
      <Version>0.1.0-1</Version>
      <ReleaseDate>2019-07-15</ReleaseDate>
      <Default>true</Default>
  </Package>
```  

Now we create a folder named *bin* inside of the *data* folder and then we copy all files from dist/main into this folder.

```console
user@machine:/path$ mkdir packages/com.vendor.product/data/bin
user@machine:/path$ cp -r dist/main/* packages/com.vendor.product/data/bin
```  

Now its time to build the setup program. There we will run the following command:  
```console
user@machine:/path$ binarycreator -f -c config/config.xml -p packages DemoApplication-Linux-1.0.0.Setup
``` 
This command will create the file DemoApplication-Linux-1.0.0.Setup which can be shipped to customers.  
If you do not have a path to binarycreator you can find it under *Qt/Tools/QtInstallerFramework/3.1/bin*

You can start the setup with just a double-click.  
![setup](../images/setup.png "setup")

##Summary
At the end we have also build an installation package which we can send to our customers of can publish on the internet. This package includes all necessary libraries and also Python itself. 