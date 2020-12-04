<cfscript>
    region = "ap-southeast-2"
    awsCredentials = createObject('java','com.amazonaws.auth.BasicAWSCredentials').init(application.cloud_credentials.accessKeyId, application.cloud_credentials.secretAccessKey);
    awsStaticCredentialsProvider = createObject('java','com.amazonaws.auth.AWSStaticCredentialsProvider').init(awsCredentials);
    
    //Message Attributes
    senderId = "Sample Sender Id";

    attribute = createObject('java','com.amazonaws.services.sns.model.MessageAttributeValue')
        .withStringValue(senderId)
        .withDataType("String");

    smsAttributes = createObject("java","java.util.HashMap");
    smsAttributes.put("AWS.SNS.SMS.SenderID",attribute);

    snsClient = createObject('java', 'com.amazonaws.services.sns.AmazonSNSClientBuilder')
        .standard()
        .withCredentials(awsStaticCredentialsProvider)
        .withRegion(region)
        .build();

    publishRequest = createObject('java', 'com.amazonaws.services.sns.model.PublishRequest')
        .withPhoneNumber('+61-phonenumber')
        .withMessage('This is my Sample Message from CFML')
        .withMessageAttributes(smsAttributes);

    result = snsClient.publish(publishRequest);

    writeDump(result);
</cfscript>