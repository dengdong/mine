#Homebrew

在 terminal 中复制以下命令（不包括 $），跟随指引，将完成 Hombrew 安装。


```
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" 
```

`$ echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile  `

`$ brew doctor `

###Homebrew基本使用

安装包

`$ brew install <package_name>`


更新Homebrew在服务器端上的包目录：

`$ brew update`

查看包是否需要更新

`$ brew outdated`

更新包

`$ brew upgrade <package_name>`

清理包缓存

`$ brew cleanup`

查看安装的包

`$ brew list --versions`


###Homebrew Cask

通过Homebrew cask安装和管理OS x图形界面程序

```
$ brew tap caskroom/cask
$ brew install brew-cask
$ brew cask install google-chrome
$ brew udpate && brew upgrade brew-cask && brew cleanup
```

Mac 插件

```
$ brew cask install qlcolorcode
$ brew cask install qlstephen
$ brew cask install qlmarkdown
$ brew cask install quicklook-json
$ brew cask install qlprettypatch
$ brew cask install quicklook-csv
$ brew cask install betterzipql
$ brew cask install webp-quicklook
$ brew cask install suspicious-package 
```