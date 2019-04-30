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
ChAnalyzedMessage >> authorName [
	^ self author
]

{ #category : #accessing }
ChAnalyzedMessage >> chChildrenToDisplay [
	^ Array empty
]

{ #category : #accessing }
ChAnalyzedMessage >> content [
	^ self discordMessage ifNotNil: #content ifNil: [ '' ]
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

{ #category : #'accessing - discord message' }
ChAnalyzedMessage >> embeds [
	^ self discordMessage ifNotNil: #embeds ifNil: [ #() ]
]

{ #category : #'gt-extension' }
ChAnalyzedMessage >> gtLiveFor: aView [ 
	<gtView>
	self discordMessage ifNil: [ ^ aView empty ].
	^ self discordMessage gtLiveFor: aView
]

{ #category : #accessing }
ChAnalyzedMessage >> gtMessageAttachmentsFor: aView [ 
	<gtView>
	self discordMessage ifNil: [ ^ aView empty ].
	^ self discordMessage gtAttachmentsFor: aView
]

{ #category : #accessing }
ChAnalyzedMessage >> gtMessageContentFor: aView [ 
	<gtView>
	self discordMessage ifNil: [ ^ aView empty ].
	^ self discordMessage gtContentFor: aView
]

{ #category : #accessing }
ChAnalyzedMessage >> gtMessageImageFor: aView [ 
	<gtView>
	self discordMessage ifNil: [ ^ aView empty ].
	^ self discordMessage gtImageFor: aView
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
	^ ({1. 123} anySatisfy: [ :e | self conversationPart = e ]) or: [ self conversationPart asString includes: $4 ]
	
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
ChAnalyzedMessage >> numberOfAttachments [
	^ self discordMessage ifNotNil: #numberOfAttachments ifNil: 0
]

{ #category : #accessing }
ChAnalyzedMessage >> numberOfEmbeds [
	^ self discordMessage ifNotNil: #numberOfEmbeds ifNil: 0
]

{ #category : #accessing }
ChAnalyzedMessage >> printFullMessage [
	^ self discordMessage ifNotNil: #printFullMessage ifNil: [ '' ]
]

{ #category : #accessing }
ChAnalyzedMessage >> printOn: aStream [
	self author ifNil: [ ^ super printOn: aStream ].
	aStream 
		nextPutAll: 'Analyzed Message of ';
		nextPutAll: self author asString.
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
ChAnalyzedMessage >> timestamp [
	^ self date
]

{ #category : #accessing }
ChAnalyzedMessage >> url [
	^ url
]

{ #category : #accessing }
ChAnalyzedMessage >> url: anObject [
	url := anObject
]

{ #category : #accessing }
ChAnalyzedMessage >> username [
	^ self author
]
