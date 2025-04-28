import boto3
import json
import os

sender_email = os.environ['SENDER_EMAIL']
recipient_email = os.environ['RECIPIENT_EMAIL']


ses = boto3.client('ses', region_name='us-east-1')


def lambda_handler(event, context):
    try:
        response = ses.send_email(
            Source=sender_email,        
            Destination={
                'ToAddresses': [
                    recipient_email,
                ],
            },
            Message={
                'Subject': {
                    'Data': 'Test Email from Lambda',
                },
                'Body': {
                    'Text': {
                        'Data': 'Hello! This is an email sent from a Lambda function.',
                    },
                },
            },
        )
        print("Email sent! Message ID:", response['MessageId'])
        return {
            'statusCode': 200,
            'body': json.dumps('Email sent successfully!')
        }
    except Exception as e:
        print("Error sending email:", str(e))
        return {
            'statusCode': 500,
            'body': json.dumps('Failed to send email.')
        }