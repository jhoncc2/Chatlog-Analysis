Class {
	#name : #ChAnalyzedMessage,
	#superclass : #Object,
	#instVars : [
		'conversationId',
		'conversationPart',
		'date',
		'author',
		'message',
		'url',
		'discordMessage',
		'subConversationId'
	],
	#category : #'Chatlog-Analysis-Model'
}

{ #category : #accessing }
ChAnalyzedMessage >> author [
	^ author
]

{ #category : #accessing }
ChAnalyzedMessage >> author: anObject [
	author := anObject
]

{ #category : #accessing }
ChAnalyzedMessage >> conversationId [
	^ conversationId
]

{ #category : #accessing }
ChAnalyzedMessage >> conversationId: anObject [
	conversationId := anObject
]

{ #category : #accessing }
ChAnalyzedMessage >> conversationPart [
	^ conversationPart
]

{ #category : #accessing }
ChAnalyzedMessage >> conversationPart: anObject [
	conversationPart := anObject
]

{ #category : #accessing }
ChAnalyzedMessage >> date [
	^ date
]

{ #category : #accessing }
ChAnalyzedMessage >> date: anObject [
	date := anObject
]

{ #category : #accessing }
ChAnalyzedMessage >> discordMessage [
	^ discordMessage
]

{ #category : #accessing }
ChAnalyzedMessage >> discordMessage: anObject [
	discordMessage := anObject
]

{ #category : #'accesing-classification' }
ChAnalyzedMessage >> isAnswer [
	^ {2} anySatisfy: [ :e | self conversationPart == e ]
	
]

{ #category : #'accesing-classification' }
ChAnalyzedMessage >> isAnswerClarification [
	^ { 32. 23} anySatisfy: [ :e | self conversationPart == e ]
	
]

{ #category : #'accesing-classification' }
ChAnalyzedMessage >> isDiscussion [
	^ {2. 32. 23. 5} anySatisfy: [ :e | self conversationPart == e ]
	
]

{ #category : #'accesing-classification' }
ChAnalyzedMessage >> isEnding [
	^ {5} anySatisfy: [ :e | self conversationPart == e ]
	
]

{ #category : #'accesing-classification' }
ChAnalyzedMessage >> isInitiation [
	"^ ({1. 31. 13. } anySatisfy: [ :e | self conversationPart == e ]) or: [ self conversationPart asString includes: $4 ]"
	^ (self conversationPart asString includes: $1) or: [ self conversationPart asString includes: $4 ]
]

{ #category : #'accesing-classification' }
ChAnalyzedMessage >> isQuestion [
	^ {1} anySatisfy: [ :e | self conversationPart == e ]
	
]

{ #category : #'accesing-classification' }
ChAnalyzedMessage >> isQuestionClarification [
	^ {31. 13} anySatisfy: [ :e | self conversationPart == e ]
	
]

{ #category : #accessing }
ChAnalyzedMessage >> message [
	^ message
]

{ #category : #accessing }
ChAnalyzedMessage >> message: anObject [
	message := anObject
]

{ #category : #accessing }
ChAnalyzedMessage >> subConversationId [
	subConversationId ifNil: [ ^ 0 ].
	^ subConversationId 
]

{ #category : #accessing }
ChAnalyzedMessage >> subConversationId: anObject [
	subConversationId := anObject
]

{ #category : #accessing }
ChAnalyzedMessage >> url [
	^ url
]

{ #category : #accessing }
ChAnalyzedMessage >> url: anObject [
	url := anObject
]
