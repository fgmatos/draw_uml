This is a fork of ["ogom/draw_uml"](https://github.com/ogom/draw_uml) gem. We have implemented a way to define the output format of the generated diagram. Two options have been added for this:

```
:svg or :png
```
You can now set your favorite output format in `config/application.rb`
```ruby
DrawUml::Configure.image_format = :svg
```
If you do not set the output format the default value will be used (:png)

---
# DrawUML 

[![Gem Version](https://badge.fury.io/rb/draw_uml.png)](https://rubygems.org/gems/draw_uml) [![Build Status](https://travis-ci.org/ogom/draw_uml.png?branch=master)](https://travis-ci.org/ogom/draw_uml)

Drawing the Unified Modeling Language of Rack.

[Browse the documentation.](http://ogom.github.io/draw_uml/docs)

## Installation

Add this line to your application's Gemfile:

```
gem 'draw_uml', :git => 'https://github.com/fgmatos/draw_uml'
```

And then execute:

```
$ bundle
```

## Usage

Add this line to your `config/routes.rb`:

```
mount DrawUml::Engine, at: '/rails/draw/uml'
```
Create your diagrams in the `doc/diagrams` folder using [PlantUML](http://plantuml.com/) syntax:

### Example

```
@startuml
:user: --> (Use case 1)
:user: -> (Use case 2)
@enduml
```

![example](http://s.plantuml.com/imgp/140-use-case-diagram-007.png)

If you use Linux and do not have the `plantuml` binaries installed on your system, perform the installation through the command:

```
$ aptitude install plantuml
```

---

Start the server:
```
$ rails s -p 3000
```

Access your application:

```
http://localhost:3000/rails/draw/uml
```
Now you can see all the diagrams located in the `doc/diagrams` folder by selecting the model (name of diagram file). 

![example](http://ogom.github.io/draw_uml/assets/img/example.png)

## Use

* [PlantUML](http://plantuml.sourceforge.net)
* [PlantUML Cheat Sheet](http://ogom.github.io/draw_uml/plantuml)

## License

* MIT
