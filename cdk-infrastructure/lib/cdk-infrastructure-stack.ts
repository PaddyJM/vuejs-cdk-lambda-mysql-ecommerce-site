import { Stack, StackProps } from 'aws-cdk-lib'
import { Construct } from 'constructs'
import * as cdk from 'aws-cdk-lib'
import * as path from "path"

export class CdkInfrastructureStack extends Stack {
  constructor(scope: Construct, id: string, props?: StackProps) {
    super(scope, id, props)

      const api = new cdk.aws_apigateway.RestApi(this, "apigw", {
      defaultCorsPreflightOptions: {
        allowHeaders: [
          "Content-Type",
          "X-Amz-Date",
          "Authorization",
          "X-Api-Key",
        ],
        allowMethods: ["OPTIONS", "GET", "POST", "PUT", "PATCH", "DELETE"],
        allowCredentials: true,
        allowOrigins: cdk.aws_apigateway.Cors.ALL_ORIGINS,
      },
    });

    const lambda = new cdk.aws_lambda_nodejs.NodejsFunction(this, 'lambda', {
      runtime: cdk.aws_lambda.Runtime.NODEJS_14_X,
      handler: 'main',
      entry: path.join(__dirname, './lambda/index.ts'),
    })

    const resource = api.root.addResource("helloWorld");

     resource.addMethod(
      "GET",
      new cdk.aws_apigateway.LambdaIntegration(lambda, { proxy: true })
    );
  }
}
