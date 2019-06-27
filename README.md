# golish

像写`go`一样写`cpp`!

## 前提

项目基于`cmake`。

## 为何需要

`go`可能并不是最优雅的语言，但确是静态类型语言中编译最方便的语言。
其中有些特性对于大型项目的布局起到了很关键的作用：

1. 可以把方法的实现分散到多个文件中，防止文件过大
2. 编译限制：可以通过文件名后缀控制某些文件仅在对应的平台被编译进去

`golish`目标是减轻`c/c++`开发过程中编译方面的心智负担，开发人员只需指定需要编译的目录，具体选择文件的过程由`golish`搞定！

## 如何撸

```cmake
golish_collect_files(
    DIR src_dir
    OUTPUT_VAR COLLECTED_SOURCES
)

add_executable(main ${COLLECTED_SOURCES})
```

上面的`golish_collect_files`方法会用类似`go`的“口味”去去收集`src_dir`里的源文件，并将文件列表追加到`COLLECTED_SOURCES`变量中。

具体来说，目录中的源文件可以像`go`那样自由地拆分；（参照`test/split_class`下的demo）
并且如果文件名以`android`、`darwin`、`linux`、`windows`其中之一结尾，就只会把当前`platform`对应的文件编译进去。（参照`test/platform_source`下的demo）

## 计划

目前功能还能简单，会不断完善