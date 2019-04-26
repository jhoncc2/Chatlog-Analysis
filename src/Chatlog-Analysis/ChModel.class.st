Class {
	#name : #ChModel,
	#superclass : #Object,
	#category : #'Chatlog-Analysis-Model'
}

{ #category : #'instance creation' }
ChModel class >> conversationPartSymbol [
	^ #isObject
]

{ #category : #'instance creation' }
ChModel class >> fromAnalyzedMessages: analyzedMsgs [
	| filtered |
	analyzedMsgs ifNil: [ ^ nil ].
	analyzedMsgs ifEmpty: [ ^ nil ].
	
	filtered := analyzedMsgs select: self conversationPartSymbol.
	
	^ filtered isNotEmpty 
		ifTrue: [self new fromAnalyzedMessages: filtered; yourself ]  
		ifFalse: [ nil ]
	
	
]

{ #category : #'import-msgs' }
ChModel >> fromAnalyzedMessages: analyzedMsgs [

]
