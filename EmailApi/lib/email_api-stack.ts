import * as cdk from "aws-cdk-lib";
import { Construct } from "constructs";
import { Code, Runtime, Function } from "aws-cdk-lib/aws-lambda";
import { join } from "path";
import { LambdaIntegration, RestApi } from "aws-cdk-lib/aws-apigateway";
import * as iam from "aws-cdk-lib/aws-iam";

export class EmailApiStack extends cdk.Stack {
  constructor(scope: Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    // Create lambda
    const handler = new Function(this, "EmailHandler", {
      runtime: Runtime.PYTHON_3_9,
      code: Code.fromAsset(join(__dirname, "../Lambdas")),
      handler: "index.index_handler",
      environment: {
        RECIPIENT: "paremodelingautomation@gmail.com",
      },
    });

    // grant email lambda permission to invoke SES
    handler.addToRolePolicy(
      new iam.PolicyStatement({
        effect: iam.Effect.ALLOW,
        actions: ["ses:*"],
        resources: ["*"],
        sid: "SendEmailPolicySid",
      })
    );

    // create API Gateway
    const api = new RestApi(this, "Email-Api", {
      description: "Send and Receive Email API",
    });

    // Add POST route to API Gateway
    const apiPath = api.root.addResource("sendemail");
    const integration = new LambdaIntegration(handler);
    apiPath.addMethod("POST", integration);
  }
}
