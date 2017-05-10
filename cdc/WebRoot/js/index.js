/**
 * 展开列表
 * 
 * @param p
 */
function zhang(p) {
	for ( var i = 1; i < 5; i++) {
		if (i == p) {
			document.getElementById("liex" + i).style.display = "block";
		} else {
			document.getElementById("liex" + i).style.display = "none";
		}
	}
}

/**
 * 检查
 * 
 * @returns {Boolean}
 */
function check(p) {
	if (p=="user") {// 添加用户
		var zhanghao = document.getElementById("zhanghao").value;
		var userName = document.getElementById("userName").value;
		var cun = document.getElementById("cun").value;
		if (zhanghao == null || zhanghao == '' || userName == null
				|| userName == '' || cun == null || cun == '') {
			alert("信息填写不完整！");
			return false;
		}
		return true;
	} else if (p =="person") {
		var name = document.getElementById("name").value;
		var birth = document.getElementById("birth").value;
		var sfzh = document.getElementById("sfzh").value;
		var cz = document.getElementById("cz").value;
		if (sfzh == null || sfzh == '' || name == null || name == ''
				|| sfzh == null || sfzh == ''|| cz == null || cz == '') {
			alert("必填内容填写不完整！");
			return false;
		}
		return true;
	} else if (p == "family") {
		var hzxm = document.getElementById("hzxm").value;
		if (hzxm == null || hzxm == '') {
			alert("必填内容填写不完整！");
			return false;
		}
		return true;
	}else if(p=="bing"){
		var sftime = document.getElementById("sftime").value;
		if (sftime == null || sftime == '') {
			alert("必填内容填写不完整！");
			return false;
		}
		return true;
	}

}