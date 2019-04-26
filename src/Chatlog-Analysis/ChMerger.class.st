Class {
	#name : #ChMerger,
	#superclass : #Object,
	#instVars : [
		'discordMessages',
		'analyzedMessages'
	],
	#category : #'Chatlog-Analysis-Utils'
}

{ #category : #accessing }
ChMerger >> analyzedMessages [
	^ analyzedMessages
]

{ #category : #accessing }
ChMerger >> analyzedMessages: anObject [
	analyzedMessages := anObject
]

{ #category : #actions }
ChMerger >> defineConversation [
	<return: #ChConversations>
	"group messages by conversation id"
	| aGroupedMessages |
	aGroupedMessages := self analyzedMessages groupedBy: [ :eachAnalyzedMessage | 
		eachAnalyzedMessage conversationId ].
	"sanitize"
	aGroupedMessages removeKey: 0 ifAbsent: [ "ignore" ].
	"create conversation model"
	^ aGroupedMessages 
		collect: [ :eachAnalyzedMessage | 
			ChConversation new fromAnalyzedMessages: eachAnalyzedMessage ] 
		as: ChConversations.
	
]

{ #category : #accessing }
ChMerger >> discordMessages [
	^ discordMessages
]

{ #category : #accessing }
ChMerger >> discordMessages: anObject [
	discordMessages := anObject
]

{ #category : #actions }
ChMerger >> merge [
	<return: #Collection of: #ChAnalyzedMessage>
	"join messages"
	self analyzedMessages 
		with: (discordMessages copyFrom: 1 to: self analyzedMessages size) 
		collect: [ :eachAnalyzedMessage :eachDiscrodMessage | 
			eachAnalyzedMessage discordMessage: eachDiscrodMessage ].
	"sanitize"
	self analyzedMessages do: [ :eachAnalyzedMessage | 
		| aDiscriminator |
		aDiscriminator := ($# split: eachAnalyzedMessage author) second.
		self assert: aDiscriminator equals: eachAnalyzedMessage discordMessage author discriminator ].
	^ self analyzedMessages
]
