Class {
	#name : #ChAnalizedMessage,
	#superclass : #Object,
	#instVars : [
		'conversationId',
		'conversationPart',
		'date',
		'author',
		'message',
		'url',
		'disconrdMessage'
	],
	#category : #'Chatlog-Analysis-Model'
}

{ #category : #accessing }
ChAnalizedMessage >> author [
	^ author
]

{ #category : #accessing }
ChAnalizedMessage >> author: anObject [
	author := anObject
]

{ #category : #accessing }
ChAnalizedMessage >> conversationId [
	^ conversationId
]

{ #category : #accessing }
ChAnalizedMessage >> conversationId: anObject [
	conversationId := anObject
]

{ #category : #accessing }
ChAnalizedMessage >> conversationPart [
	^ conversationPart
]

{ #category : #accessing }
ChAnalizedMessage >> conversationPart: anObject [
	conversationPart := anObject
]

{ #category : #accessing }
ChAnalizedMessage >> date [
	^ date
]

{ #category : #accessing }
ChAnalizedMessage >> date: anObject [
	date := anObject
]

{ #category : #accessing }
ChAnalizedMessage >> disconrdMessage [
	^ disconrdMessage
]

{ #category : #accessing }
ChAnalizedMessage >> disconrdMessage: anObject [
	disconrdMessage := anObject
]

{ #category : #accessing }
ChAnalizedMessage >> message [
	^ message
]

{ #category : #accessing }
ChAnalizedMessage >> message: anObject [
	message := anObject
]

{ #category : #accessing }
ChAnalizedMessage >> url [
	^ url
]

{ #category : #accessing }
ChAnalizedMessage >> url: anObject [
	url := anObject
]
