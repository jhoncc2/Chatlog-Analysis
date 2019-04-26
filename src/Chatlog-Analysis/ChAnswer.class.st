Class {
	#name : #ChAnswer,
	#superclass : #ChMessagesCollection,
	#category : #'Chatlog-Analysis-Model'
}

{ #category : #'instance creation' }
ChAnswer class >> conversationPartSymbol [
	^ #isAnswer
]

{ #category : #accessing }
ChAnswer >> printOn: aStream [
	aStream nextPutAll: 'Answer of '.	
	self messages ifNotEmpty: [ 
		aStream nextPutAll: self messages first author asString ].
	
]
