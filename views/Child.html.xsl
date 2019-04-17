<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="ViewBase.html.xsl"/>

<!--************* Main template ******************** -->		
<xsl:template match="/document">
<html>
	<head>
		<xsl:call-template name="initHead"/>
		
		<title>sksks</title>
		
		<script>		
			function beforeUnload(){
				if (window.m_childForms){
					for(var fid in window.m_childForms){
						if (window.m_childForms[fid]){
							window.m_childForms[fid].close();
						}
					}
				}
				if (window.onClose){
					window.onClose();
				}
			}
			function pageLoad(){				
				var application;
				if (window.getApp){
					application = window.getApp();
					<xsl:call-template name="initAppWin"/>
					<xsl:if test="/document/model[@id='ModelServResponse']/row/result='1'">
					throw Error(CommonHelper.longString(function () {/*
					<xsl:value-of select="/document/model[@id='ModelServResponse']/row/descr"/>
					*/}));
					</xsl:if>	
					
				}
				else{
				<xsl:call-template name="initApp"/>
				}
				
				<xsl:call-template name="modelFromTemplate"/>
			<xsl:if test="/document/model[@id='ModelServResponse']/row/result='1'">
				throw Error("<xsl:value-of select="/document/model[@id='ModelServResponse']/row/descr"/>");
			</xsl:if>	
				
			}
		</script>
	</head>
	
	<body onload="pageLoad();" onbeforeunload="beforeUnload()">
	
	    <div class="container-fluid">

		<div class="row">
		    <div id="windowData" class="col-lg-12">
		    	<xsl:apply-templates select="model[@htmlTemplate='TRUE']"/>
		    </div>
		    <div class="windowMessage hidden">
		    </div>		    
		    <!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
	    </div>
	    <!-- /.container-fluid -->	    
	<xsl:call-template name="initJS"/>
	</body>
</html>		
</xsl:template>

</xsl:stylesheet>
