/** Copyright (c) 2016
 *	Andrey Mikhalevich, Katren ltd.
 */
function UserList_View(id,options){	

	UserList_View.superclass.constructor.call(this,id,options);
	
	var model = options.models.UserList_Model;
	var contr = new User_Controller();
	
	var constants = {"doc_per_page_count":null,"grid_refresh_interval":null};
	window.getApp().getConstantManager().get(constants);
	
	var popup_menu = new PopUpMenu();
	
	this.addElement(new GridAjx(id+":grid",{
		"model":model,
		"controller":contr,
		"editInline":false,
		"editWinClass":User_Form,
		"commands":new GridCmdContainerAjx(id+":grid:cmd"),		
		"popUpMenu":popup_menu,
		"head":new GridHead(id+"-grid:head",{
			"elements":[
				new GridRow(id+":grid:head:row0",{
					"elements":[
						new GridCellHead(id+":grid:head:id",{
							"columns":[
								new GridColumn("id",{"field":model.getField("id")})
							],
							"className":window.getBsCol(1),
							"sortable":true
						}),					
						new GridCellHead(id+":grid:head:name",{
							"columns":[
								new GridColumn("name",{"field":model.getField("name")})
							],
							"className":window.getBsCol(3),
							"sortable":true,
							"sort":"asc"							
						}),
						new GridCellHead(id+":grid:head:email",{
							"columns":[
								new GridColumn("email",{"field":model.getField("email")})
							],
							"className":window.getBsCol(2)
						})					
					]
				})
			]
		}),
		"pagination":new GridPagination(id+"_page",
			{"countPerPage":constants.doc_per_page_count.getValue()}),		
		
		"autoRefresh":false,
		"refreshInterval":constants.grid_refresh_interval.getValue()*1000,
		"rowSelect":false,
		"focus":true
	}));	
	


}
extend(UserList_View,ViewAjx);
