# UpdateIpToCloudflare
用于将本机的ip定时向Cloudflare中进行更新，可以自行设置更新时长

代码默认更新时长是15分钟一次；
使用流程：
1. 在Cloudflare网页端新建/选定一个域名;
2. 运行get_record_id.bat获取域名对应的record_id，复制粘贴到update_ip_to_domain_900s.bat文件中对应的变量值中；
3. 
