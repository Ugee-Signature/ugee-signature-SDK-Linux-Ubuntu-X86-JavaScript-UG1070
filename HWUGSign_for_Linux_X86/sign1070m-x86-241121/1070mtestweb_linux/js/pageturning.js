
var obj;
var pgindex = 1; //当前页
var allpages = 1;//总页数

	function pageUp()
	{
	
		if(pgindex >0)
		{			
			//alert(pgindex);
			pgindex -=1;
			obj.scrollTop = (pgindex-1) * parseInt(obj.offsetHeight); //根据高度，输出指定的页
		}
	}
	
	function pageDown()
	{
		if(pgindex <= allpages)
		{									
			pgindex +=1;
			obj.scrollTop = (pgindex-1) * parseInt(obj.offsetHeight);			
		}
	}
	
	function pageInit()
	{
		obj = document.getElementById("frameContent"); //获取内容层
		allpages = Math.ceil(parseInt(obj.scrollHeight) / parseInt(obj.offsetHeight)); //获取页面数量
	}