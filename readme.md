# Snippets:

## sRadio
[\assets\snippets\sradio\]
Dysplay socialmedia icons
### Usage:
```php
[[sRadio? &layout=`fb, vk, od` &lng=`en`]] //Display only Facebook, Vkontakte and Odnoklassniki logos with English titles
```
## 4Manager
[\assets\snippets\4Manager-snippet.tpl]
Show info only for manager
### Usage:
```php
[!4Manager? &out=`chunk||string`!] // Only uncahced
```
## lngChange
[\assets\snippets\lngChange-snippet.tpl]
Show link to another language ( ../ru/about.html -> ../en/about.html, etc. )
### Usage:
```php
[!lngChange? &langs=`ru,4;en,5`!]
```
## smg
[\assets\snippets\smg-snippet.tpl]
Generate image gallery from folder
### Usage:
```php
[[smg? &dir=`images/` &show=`6` &description=`image1;image2;image3;image4;image5;image6` &class=`images` &size=`200xauto` &wrapp=`id_1;id_2;id_3` &wrappout=`site_1.ru,site_2.ru,site_3.ru` &slider=`1`]]
```

# Plugins:

## AddVersion
[\assets\plugins\AddVersion-plugin.tpl]
Add postfix-version to CSS and JS files width edit date

## dIE
[\assets\plugins\dIE-plugin.tpl]
Out message for IE customizable with chunk

## QuickLinks
[\assets\plugins\QuickLinks-plugin.tpl]
Create quick edit links in main page of manager panel

# Other:

## QuickLinks
[manager\media\style\common\login.tpl]
Custom MODX Login page with build-in styles
