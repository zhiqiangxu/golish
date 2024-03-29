# golish

像编译`go`一样编译`c/c++`!

## 前提

项目基于`cmake`。

## 为何需要

`go`可能并不是最优雅的语言，但确是静态类型语言中编译极为方便的语言。
其中有些特性对于大型项目的布局起到了很关键的作用：

1. 可以把方法的实现分散到多个文件中，防止文件过大
2. 编译限制：可以通过文件名后缀控制某些文件仅在对应的平台被编译进去

`golish`目标是减轻`c/c++`开发过程中编译方面的心智负担，开发人员只需指定需要编译的目录，具体选择文件的过程由`golish`搞定！

## 如何撸

`CMakeLists.txt`:
```cmake

include(GolishUtils.cmake) # 按需调整路径
golish_collect_files(
    DIR src_dir # 源代码所在目录
    OUTPUT_VAR COLLECTED_SOURCES # 收集文件列表的变量名
)

add_executable(main ${COLLECTED_SOURCES})
```

上面的`golish_collect_files`方法会用类似`go`的“口味”去收集`src_dir`中的源文件，并将文件列表追加到`COLLECTED_SOURCES`变量中。

具体来说：

- 目录中的源文件可以像`go`那样自由地拆分；（参照[`test/split_class`](https://github.com/zhiqiangxu/golish/tree/master/test/split_class)）
- 并且如果文件名以`android`、`darwin`、`linux`、`windows`其中之一结尾，就只会把当前`platform`对应的文件编译进去。（参照[`test/platform_source`](https://github.com/zhiqiangxu/golish/tree/master/test/platform_source)）

## 计划

目前功能还很简单，会不断完善