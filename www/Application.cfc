component {

	this.name="servedockerrless";
	this.applicationTimeout = CreateTimeSpan(10, 0, 0, 0); //10 days
	this.sessionManagement=false;
	this.clientManagement=false;
	this.setClientCookies=false;
	this.javaSettings = {
		LoadPaths = ["/jars/"],
		reloadOnChange=true,
		watchInterval=30
	}
	
	function onApplicationStart() {

		application.counter = 0;
        application.cloud_credentials = {
            "vendorName" : "AWS",
            "region" : "ap-southeast-2",
            "accessKeyId" : server.system.environment.TestACCESS_KEY, 
            "secretAccessKey" : server.system.environment.TestSECRET_KEY
        };

		return true;
	}

}