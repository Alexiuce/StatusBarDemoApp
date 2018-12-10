#  Core Animation


### animation 执行的四个阶段
1. layout(布局):
 > 初始化layer 及其属性:border/backgroundColor/shadow....
2. display(显示):
> 图片处理(绘制): drawRect: / -drawLayer:context:    
3. prepare(准备):
> 要将 animation data 打包发送给渲染服务进程(render server);
   这里会将图片资源进行解压处理
4. commit(提交):
> 打包layer 和动画数据,最后通过IPC方式发送到渲染服务;

### render server 的两个操作
> 一旦渲染服务接收到Core Animation 发送来的数据,就会对其进行反序列化,并形成渲染树(render tree);
> 根据渲染树,渲染服务执行下面两个操作:
1. 计算所有的layer 的属性过渡值(中间值),并初始化openGL;
2. 渲染可见形状(到屏幕);

** 一共六个步骤(四个阶段+两个操作)中,前五个由CPU处理,最后一个由GPU处理,我们可以控制的只有前两个步骤 **

### develop git branch 

* 添加Git 分支

* 添加Git feature 分支

* 添加 xiuce 用户提交




