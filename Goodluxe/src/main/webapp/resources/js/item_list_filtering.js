function filtering_check(){
	
	var selected_brand = "";
	var selected_category = "";
	var selected_grade = "";
	var selected_price = "";
	selected_brand = document.il_search_form.il_search_brand.value;
	selected_category = document.il_search_form.il_search_category.value;
	selected_grade = document.il_search_form.il_search_grade.value;
	selected_price = document.il_search_form.il_search_price.value;
	
	var action_locate = "./itemList.do?il_search_brand="+selected_brand
		+"&il_search_category="+selected_category+"&il_search_grade="+selected_grade+
		"&il_search_price="+selected_price;
	
	document.il_search_form.action = action_locate;
	return true;

}


