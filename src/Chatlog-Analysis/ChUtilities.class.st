Class {
	#name : #ChUtilities,
	#superclass : #Object,
	#category : #'Chatlog-Analysis-Utils'
}

{ #category : #'loading dataset' }
ChUtilities class >> importAnalyzedMessagesFromCSV [
	<gtExample>
	^ self importAnalyzedMessagesFromCSVFile: 'analysis.csv'
]

{ #category : #'loading dataset' }
ChUtilities class >> importAnalyzedMessagesFromCSVFile: aFileReference [
	<return: #Array of: #ChAnalyzedMessage>
	^ ChAnalyzedMessagesImporter new readFileReference: aFileReference asFileReference
]

{ #category : #'loading dataset' }
ChUtilities class >> importDiscordMessagesFromJSON [
	<gtExample>
	^ self importDiscordMessagesFromJSONFile: 'discord.json'
]

{ #category : #'loading dataset' }
ChUtilities class >> importDiscordMessagesFromJSONFile: aFileReference [
	<return: #DSMessages>
	| aMessages |
	aMessages := aFileReference asFileReference readStreamDo: [ :aStream | 
		DSModelJsonMapping readMessages: aStream contents ].
	aMessages sort: [ :a :b | a timestamp < b timestamp ].
	^ aMessages
]

{ #category : #'loading dataset' }
ChUtilities class >> mergeAnalyzedAndDiscrodMessagesToConversations [
	<gtExample>
	^ ChMerger new
		discordMessages: self importDiscordMessagesFromJSON;
		analyzedMessages: self importAnalyzedMessagesFromCSV;
		merge;
		defineConversation
]
