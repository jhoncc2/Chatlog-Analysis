Class {
	#name : #ChAnalyzedMessagesImporter,
	#superclass : #Object,
	#instVars : [
		'messages'
	],
	#category : #'Chatlog-Analysis-Model'
}

{ #category : #initialization }
ChAnalyzedMessagesImporter >> neoCSVReader [
	^ NeoCSVReader new
		recordClass: ChAnalyzedMessage;
		addIntegerField: #conversationId: ;
		addIntegerField: #subConversationId: ;
		addIntegerField: #conversationPart: ;
		addIgnoredFields: 5;
		addField: #date: converter: [ :aString | aString asDateAndTime ];
		addField: #author: ;
		addField: #message: ;
		addField: #url:
]

{ #category : #actions }
ChAnalyzedMessagesImporter >> readFileReference: aString [
	^ aString readStreamDo: [ :aStream | 
		self readStream: aStream ]
]

{ #category : #actions }
ChAnalyzedMessagesImporter >> readStream: aStream [
	^ (self neoCSVReader on: aStream) 
		skipHeader;
		upToEnd
]

{ #category : #actions }
ChAnalyzedMessagesImporter >> readString: aString [
	^ aString readStreamDo: [ :aStream | 
		self readStream: aStream ]
]
