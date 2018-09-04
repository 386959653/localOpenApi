# officialWeb
- 企业官网
- 使用方法：
    1. idea中checkout from version control
    2. 数据库初始化：在mysql数据库中执行sql脚本文件doc/sqlScript/databaseInit.sql
    3. 在idea中配置tomcat，默认端口8080
    4. 用浏览器访问 http://localhost:8080/
    5. 如果用jrebel，由于与mybatis热部署冲突（两者竞争修改mappper文件夹下的xml文件，
    可能会导致文件拒绝访问，从而导致热部署失败），记得修改rebel.xml，让jrebel不需要热部署mappper文件夹下的xml文件
- 主要功能：
    1. 实现首页响应式导航条
    2. 实现公司介绍页面
    3. 实现联系我们页面（嵌入百度地图）
    4. 实现新品介绍列表页
    5. 实现介绍具体产品的页面，并实现分享功能
    6. 实现首页内容和轮播图
    7. 实现底部导航条
    8. 实现了各个页面的访问统计
    9. 实现在线Excel风格编辑表格，并且是响应式的
    10. 实现首页轮播图在后台的增删改查
    11. 实现后台页面的权限控制
    12. 实现上传轮播图
    13. 实现设置联系方式
    14. 实现设置产品
    15. 实现响应式登录页面
    16. 实现sidebar响应式
    17. 实现freemarker从session获取用户名
    18. 实现maven自动部署到远程服务器
    19. 实现slickgrid分页，并且可以通过区分手机端和PC端来决定每页的页数
- 个性化功能：
    1. 实现jrebel注册管理