import * as cdk from "aws-cdk-lib";
import { Construct } from "constructs";
import { Code, Runtime, Function } from "aws-cdk-lib/aws-lambda";
import { join } from "path";
import { LambdaIntegration, RestApi } from "aws-cdk-lib/aws-apigateway";

export class EmailApiStack extends cdk.Stack {
  constructor(scope: Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    const handler = new Function(this, "EmailHandler", {
      runtime: Runtime.PYTHON_3_9,
      code: Code.fromAsset(join(__dirname, "../Lambdas")),
      handler: "index.index_handler",
      environment: {
        RECIPIENT: "paremodelingautomation@gmail.com",
        AWS_REGION: "us-east-1",
      },
    });
    const api = new RestApi(this, "Email-Api", {
      description: "Send and Receive Email API",
    });

    const apiPath = api.root.addResource("sendemail");
    const integration = new LambdaIntegration(handler);
    apiPath.addMethod("POST", integration);
  }
}
