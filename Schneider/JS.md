#### [JS中this的四种用法](https://segmentfault.com/a/1190000003046071)

this指的是，调用函数的那个对象。 

1. 在一般函数方法中使用 this 指代全局对象
2. 作为对象方法调用，this 指代上级对象
3. 作为构造函数调用，this 指代new 出的对象
4. apply 调用 ，apply方法作用是改变函数的调用对象，此方法的第一个参数为改变后调用这个函数的对象，this指代第一个参数