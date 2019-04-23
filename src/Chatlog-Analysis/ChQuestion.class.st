Class {
	#name : #ChQuestion,
	#superclass : #ChMessagesCollection,
	#category : #'Chatlog-Analysis-Model'
}

{ #category : #'instance creation' }
ChQuestion class >> conversationPartSymbol [
	^ #isQuestion
]
