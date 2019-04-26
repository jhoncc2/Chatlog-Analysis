Class {
	#name : #ChConversations,
	#superclass : #ChCollection,
	#category : #'Chatlog-Analysis-Model'
}

{ #category : #accessing }
ChConversations >> gtConversationsFor: aView [
	<gtView>
	^ aView tree 
		title: 'Conversations';
		priority: 1;
		items: [ self ];
		children: [ :item | item chChildrenToDisplay ]
]
