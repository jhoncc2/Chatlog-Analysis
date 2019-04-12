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
		recordClass: ChAnalizedMessage;
		addIntegerField: #conversationId: ;
		addIgnoredField;
		addIntegerField: #conversationPart: ;
		addIgnoredFields: 5;
		addField: #date: converter: [ :aString | aString asDateAndTime ];
		addField: #author: ;
		addField: #message: ;
		addField: #url:
]

{ #category : #actions }
ChAnalyzedMessagesImporter >> readFileReference: aFileReference [
	^ aFileReference asFileReference readStreamDo: [ :aStream | 
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
