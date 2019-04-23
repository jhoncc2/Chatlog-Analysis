Class {
	#name : #ChEnding,
	#superclass : #ChMessagesCollection,
	#category : #'Chatlog-Analysis-Model'
}

{ #category : #'instance creation' }
ChEnding class >> conversationPartSymbol [
	^ #isEnding
]

{ #category : #adding }
ChEnding >> addMessage: aDSMessage [
	self messages addLast: aDSMessage
]

{ #category : #'gt-extension' }
ChEnding >> chChildrenToDisplay [
	self messages ifNotNil: [ ^ self messages ].
	^ Array empty 
]

{ #category : #initialization }
ChEnding >> initialize [
	super initialize.
	messages := ChCollection new: 1.
]

{ #category : #convenience }
ChEnding >> numberOfMessages [
	^ self messages ifNotNil: #size ifNil: 0
]
