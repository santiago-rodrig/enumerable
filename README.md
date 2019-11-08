# Enumerable methods

This proyect has as a goal the recreation of some of the methods provided by the
[Enumerable](https://ruby-doc.org/core-2.6.3/Enumerable.html) module.
Project instructions are in [The Odin Project](https://www.theodinproject.com/courses/ruby-programming/lessons/advanced-building-blocks#project-2-enumerable-methods).

## Methods provided

For every method emulated, just **prepend** `my_`
to each of them, i.e, `my_each` would be the recreated version of the original `each`.
The following is a list of the methods written from scratch with Ruby.

 - [x] `each`
 - [x] `each_with_index`
 - [x] `select`
 - [x] `all?`
 - [x] `any?`
 - [x] `none?`
 - [x] `count`
 - [x] `map`
 - [x] `inject`

## How to setup

First of all, install the __Ruby__ interpreter, you can find the instructions of how to do this
[here](https://www.theodinproject.com/courses/web-development-101/lessons/installing-ruby).

After installing Ruby, __clone__ the repository and change your current directory to the one created after the cloning.

```console
$ git clone https://github.com/santiago-rodrig/enumerable.git
$ cd enumerable
```

## How to run the tests

First, you'll need to install the [gem](https://en.wikipedia.org/wiki/RubyGems) __bundler__.
This is required for installing the gems required for running the tests.

```console
$ gem install bundler
```

Make sure that your current directory is the one that corresponds to this repository on you local machine (_obiously_).

Now, install the required gems for running the tests.

```console
$ bundle install
```

Run the tests!

Run all the tests in general.

```console
$ rspec
```

Run a specific test.

```console
$ rspec spec/loops_spec.rb
```

Change the output format.

```console
$ rspec spec/misc_spec.rb --format p
```

Find more options available for the `rspec` command.

```console
$ rspec --help
```

### Collaborators to the creation of the test suite

[@mohamednaser](https://github.com/mohamednaser)

### Especial thanks

Thanks to the [Microverse](https://www.microverse.org/) program for giving me the opportunity to incursionate in the developers world.
