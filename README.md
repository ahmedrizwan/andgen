<img src="https://www.iconfinder.com/icons/298878/download/png/128" width="48" /> 
#Andgen


A terminal based templates generator for Android! 

It's similar to what 'rails generate' command does on Ruby on Rails.

###Why?
Because terminals are awesome! And some [other reasons] (https://medium.com/@ahmedrizwan/andgen-generating-android-templates-from-terminal-616e2cb3afa6#.uf1tstpsu)...

###Installation
Using HomeBrew
```
brew tap ahmedrizwan/andgen
brew install andgen
```

###Usage

Navigate to the module directory of your project 

To see available commands and format, do

```
andgen --help
```

###Generating Activities

To check the format and examples, execute
```
andgen activity
```

####Simple activity creation
```
andgen activity SomeActivity
```
<img src="https://raw.githubusercontent.com/ahmedrizwan/homebrew-andgen/master/activity_create.png" width="550px"  />

Generated file will look like

<img src="https://raw.githubusercontent.com/ahmedrizwan/homebrew-andgen/master/activity_file.png" width="550px"  />

####Create activity with Layout
```
andgen activity -l SomeActivity
```
<img src="https://raw.githubusercontent.com/ahmedrizwan/homebrew-andgen/master/activity_layout_create.png" width="550px"  />

<img src="https://raw.githubusercontent.com/ahmedrizwan/homebrew-andgen/master/simple_layout.png" width="550px"  />

<img src="https://raw.githubusercontent.com/ahmedrizwan/homebrew-andgen/master/activity_layout_file.png" width="550px"  />

####Create activity with bindable layout
```
andgen activity -bl SomeActivity
```
<img src="https://raw.githubusercontent.com/ahmedrizwan/homebrew-andgen/master/activity_layout_create.png" width="550px"  />

<img src="https://raw.githubusercontent.com/ahmedrizwan/homebrew-andgen/master/bindable_layout.png" width="550px"  />

<img src="https://raw.githubusercontent.com/ahmedrizwan/homebrew-andgen/master/activity_binding_file.png" width="550px"  />
####Create acvivity and place it inside some package
```
andgen activity SomeActivity com.example
```
<img src="https://raw.githubusercontent.com/ahmedrizwan/homebrew-andgen/master/activity_package.png" width="550px" />

No one would want to write down full package! So simply do this
```
andgen activity SomeActivity example
```
<img src="https://raw.githubusercontent.com/ahmedrizwan/homebrew-andgen/master/activity_package.png" width="550px" />

But what if there's a conflict!? 
No worries, andgen will ask you to select the package

<img src="https://raw.githubusercontent.com/ahmedrizwan/homebrew-andgen/master/activity_package_conflict.png"  width="450px"/>

###Generating Fragments

Same commands and format as Activities

<img src="https://raw.githubusercontent.com/ahmedrizwan/homebrew-andgen/master/fragment.png"  width="650px"/>

####Simple Fragment

``` andgen fragment SomeFragment ```

<img src="https://raw.githubusercontent.com/ahmedrizwan/homebrew-andgen/master/fragment_create.png"  width="550px"/>

####Fragment with a Layout

``` andgen fragment -l SomeFragment ```

<img src="https://raw.githubusercontent.com/ahmedrizwan/homebrew-andgen/master/fragment_layout_create.png"  width="550px"/>

####Fragment with a Bindable Layout

``` andgen fragment -bl SomeFragment ```

<img src="https://raw.githubusercontent.com/ahmedrizwan/homebrew-andgen/master/fragment_layout_create.png"  width="550px"/>

This will generate code like 

<img src="https://raw.githubusercontent.com/ahmedrizwan/homebrew-andgen/master/fragment_file.png"  width="550px"/>

###Generating Layouts
For a simple layout
```
andgen layout my_layout
```

<img src="https://raw.githubusercontent.com/ahmedrizwan/homebrew-andgen/master/layout_create.png" width="550px"/>

And for bindable layout (which is enclosed inside *layout* tag)
```
andgen layout -bl my_layout
```

<img src="https://raw.githubusercontent.com/ahmedrizwan/homebrew-andgen/master/bindable_layout.png" width="550px"/>

###TODO
* Add more templates : EmptyActivity, ListActivity and so on
* Add third party templates for : Mosby, Conductor etc
* Fix bugs

[More Details](https://medium.com/@ahmedrizwan/andgen-generating-android-templates-from-terminal-616e2cb3afa6#.uf1tstpsu)

##License 
```
Copyright 2016 Ahmed Rizwan

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```


