# UpdateIpToCloudflare
获取电脑特定网卡的ipv4地址，定时更新到Cloudflare中，可以自行设置更新时长

默认更新时长是15分钟一次；  
！！！一定要先修改参数再运行！！！  
文件中要更改的参数如下：  
REM 日志文件update_log.txt的存储路径，最好是绝对路径，因为Windows中运行计划任务时是根部目录，日志文件不好找  
set "log_file=E:\update_ip_to_domain\update_log.txt"       
  
REM 执行的间隔时间，单位是 秒，默认是15分钟  
set "interval=900"          
  
REM Cloudflare对应的邮箱  
set "API_EMAIL=XXXXXX@XXX.com"         
  
REM 在Cloudflare界面中找，  个人资料/API令牌/API密钥/Global API Key  
set "API_KEY=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"     
  
REM 在Cloudflare界面中找,具体自行百度  
set "ZONE_ID=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"    
  
REM 运行get_record_id.bat后获取   
set "RECORD_ID=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"      
  
REM 要映射的域名     
set "DNS_NAME=xxxxx.xxxx.xxxx"        
  
REM 记录类型，一般来说默认即可。具体每个类型的说明请参考Cloudflare官方说明文档      
set "RECORD_TYPE=A"            
  
REM 要获取无线网的ip那么使用默认即可。如果要获取有线网ip，那么在电脑端命令行通过运行ipconfig,来获取你想要的网卡名字，然后原封不动的复制到这里来！是中文就复制中文，是英文就复制英文。如果运行失败，那么就是电脑文字编码有问题，建议网上查找解决的方案。     
set "ADAPTER_NAME=WLAN"         
  
使用流程：
1. 在Cloudflare网页端新建/选定一个域名;
2. 更改get_record_id.bat文件参数并运行，获取域名对应的record_id，复制粘贴到update_ip_to_domain_900s.bat文件中对应的变量值中；
3. 按照上述说明更改update_ip_to_domain_900s.bat文件中对应的参数；
4. 设置Windows电脑任务计划程序，实现按需运行（使用方式请百度）；

PS:在.bat语法中，REM是注解的，因为注解是中文写的，所以最好不要把注解放到文件中运行，不然可能会存在乱码导致运行报错。
