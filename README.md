<img src="https://www.iconfinder.com/icons/298878/download/png/128" width="48" /> 
#Andgen


A terminal based templates generator for Android!

###Why?
Because terminals are awesome!

###Installation?
Using HomeBrew
```
brew tap ahmedrizwan/andgen
brew install andgen
```

###Usage
```
andgen --help
```
<img src="https://raw.githubusercontent.com/ahmedrizwan/homebrew-andgen/master/help.png" width="550px" />

####Generating Activities
```
andgen activity
```
<img src="https://raw.githubusercontent.com/ahmedrizwan/homebrew-andgen/master/activity.png" width="550px" />

Just create activity
```
andgen activity SomeActivity
```
Create activity with Layout
```
andgen activity -l SomeActivity
```
Create activity with bindable layout
```
andgen activity -bl SomeActivity
```
Create acvivity and place it inside some package
```
andgen activity SomeActivity com.something.somethingelse
```
No one would want to write down full package! So simply do this
```
andgen activity SomeActivity somethingelse
```

####Generating Fragments

####Generating Layouts

###TODO
* Add more templates : EmptyActivity, ListActivity and so on
* Add third party templates for : Mosby, Conductor etc


