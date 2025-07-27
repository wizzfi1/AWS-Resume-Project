import { DynamoDBClient } from "@aws-sdk/client-dynamodb";
import { DynamoDBDocumentClient, UpdateCommand } from "@aws-sdk/lib-dynamodb";

const client = new DynamoDBClient({});
const ddb = DynamoDBDocumentClient.from(client);

export const handler = async (event) => {
  console.log("✅ Lambda triggered with event:", JSON.stringify(event));

  try {
    const params = {
      TableName: "visitor-counter",
      Key: { id: "resume" },
      UpdateExpression: "SET #v = if_not_exists(#v, :zero) + :incr",
      ExpressionAttributeNames: {
        "#v": "views"
      },
      ExpressionAttributeValues: {
        ":incr": 1,
        ":zero": 0
      },
      ReturnValues: "UPDATED_NEW"
    };

    const result = await ddb.send(new UpdateCommand(params));
    console.log("✅ DynamoDB update result:", result);

    return {
      statusCode: 200,
      headers: {
        "Access-Control-Allow-Origin": "*"
      },
      body: JSON.stringify({ views: result.Attributes.views })
    };
  } catch (err) {
    console.error("❌ Lambda error:", err);
    return {
      statusCode: 500,
      headers: {
        "Access-Control-Allow-Origin": "*"
      },
      body: JSON.stringify({ message: "Internal Server Error" })
    };
  }
};
