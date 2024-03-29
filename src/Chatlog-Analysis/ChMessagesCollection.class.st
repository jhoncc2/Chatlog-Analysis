Class {
	#name : #ChMessagesCollection,
	#superclass : #ChModel,
	#instVars : [
		'messages'
	],
	#category : #'Chatlog-Analysis-Model'
}

{ #category : #adding }
ChMessagesCollection >> addMessage: aDSMessage [
	self messages addLast: aDSMessage
]

{ #category : #'gt-extension' }
ChMessagesCollection >> chChildrenToDisplay [
	self messages ifNotNil: [ ^ self messages ].
	^ Array empty
]

{ #category : #accessing }
ChMessagesCollection >> fromAnalyzedMessages: analyzedMessages [
	super fromAnalyzedMessages: analyzedMessages.
	self messages: analyzedMessages
]

{ #category : #'gt-extension' }
ChMessagesCollection >> gtLiveFor: aView [
	<gtView>
	(self messages isNil or: [ self messages isEmpty ])
		ifTrue: [ ^ aView empty ].
	^ self messages gtLiveFor: aView
]

{ #category : #initialization }
ChMessagesCollection >> initialize [
	super initialize.
	messages := DSMessages new: 1.
]

{ #category : #accessing }
ChMessagesCollection >> messages [
	^ messages
]

{ #category : #accessing }
ChMessagesCollection >> messages: anObject [
	messages := anObject
]

{ #category : #convenience }
ChMessagesCollection >> numberOfMessages [
	^ self messages ifNotNil: #size ifNil: 0
]
