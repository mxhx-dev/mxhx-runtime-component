# MXHX Runtime Component

A Haxe library for developing run-time parsed components with [MXHX](https://mxhx.dev/).

This _mxhx-runtime-component_ library provides the [core language tags](https://mxhx.dev/learn/language-tags/) the [core language types](https://mxhx.dev/learn/core-types/) of MXHX only. To build GUIs with MXHX, you must install an additional library for the GUI framework of your choice. For example:

- [mxhx-feathersui](https://github.com/mxhx-dev/mxhx-feathersui)
- [mxhx-minimalcomps](https://github.com/mxhx-dev/mxhx-minimalcomps)

## Important

The compiler must include `@:rtti` metadata for every type that will be referenced by `MXHXRuntimeComponent`. You can add `@:rtti` metadata to all classes in a package using the following compile-time macro.

```hxml
--macro addGlobalMetadata('com.example', '@:rtti', true, true, false)
```

Additionally, since `MXHXRuntimeComponent` parses MXHX data at run-time, it's possible that the Haxe compiler may not know at compile-time which classes will be required. The following compile-time macro may be used to manually include all classes in a package.

```hxml
--macro include('com.example')
```

## Minimum Requirements

- Haxe 4.3

## Installation

This library is not yet available on Haxelib, so you'll need to install it from Github.

```sh
haxelib git mxhx-runtime-component https://github.com/mxhx-dev/mxhx-runtime-component.git
```

## Project Configuration

After installing the library above, add it to your Haxe _.hxml_ file.

```hxml
--library mxhx-runtime-component
```

For Lime and OpenFL, add it to your _project.xml_ file.

```xml
<haxelib name="mxhx-runtime-component" />
```
