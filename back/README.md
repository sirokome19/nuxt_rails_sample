# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Questionnaire POST style
{
	"questionnaire": 
	{ 
		"abstract": "fuga" ,
		"order_questions":[{
			"question":{
				"type":"ChoiceQuestion",
				"options":
					[{
					"text":"option1",
					"image_url":"hoge.png"
					},{
					"text":"option2",
					"image_url":"fuga.png"
					}]
			}
		},{
			"question":{
				"type":"FreeQuestion",
				"text":"hoge"
			}
		}]
	}
}