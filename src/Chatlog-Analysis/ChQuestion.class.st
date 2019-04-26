Class {
	#name : #ChQuestion,
	#superclass : #ChMessagesCollection,
	#category : #'Chatlog-Analysis-Model'
}

{ #category : #'instance creation' }
ChQuestion class >> conversationPartSymbol [
	^ #isQuestion
]

{ #category : #accessing }
ChQuestion >> printOn: aStream [
	aStream nextPutAll: 'Question of '.	
	self messages ifNotEmpty: [ 
		aStream nextPutAll: self messages first author asString ].
	
]
