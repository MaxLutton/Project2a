#include "SortedList.h"
#include <string.h>

void SortedList_insert(SortedList_t *list, SortedListElement_t *element)
{
  if (opt_yield & INSERT_YIELD)
    sched_yield();
  //empty list
  if (list->next == NULL)
    {
      list->next = element;
      element->prev = list;
      element->next = NULL;
      return;
    }
  //dont want to de-reference head ptr's key
  SortedListElement_t* temp = list->next;
  
  while(temp->next != NULL)
    {
      //element key < list[i] key
      if (strcmp(element->key, temp->key) < 0)
	{
	  (temp->prev)->next = element;
	  element->prev = temp->prev;
	  temp->prev = element;
	  element->next = temp;
	  return;
	}
      temp = temp->next;
    }
  
  if (temp->next == NULL)
    {
      temp->next = element;
      element->prev = temp;
      element->next = NULL;
      return;
    }
}

int SortedList_delete( SortedListElement_t *element)
{
  if (opt_yield & DELETE_YIELD)
    sched_yield();
  //if last element in list
  if (element->next == NULL)
    {
      element->prev->next = NULL;
      return 0;
    }
  if (element->prev->next == element && element->next->prev == element)
    {
      (element->prev)->next = element->next;
      (element->next)->prev = element->prev;
      //free(element);
      return 0;
    }
  else
    return 1;
}
SortedListElement_t *SortedList_lookup(SortedList_t *list, const char *key)
{
  if (opt_yield & LOOKUP_YIELD)
    sched_yield();
  if (list->next == NULL)
    return NULL;
  SortedListElement_t*  temp = list;
  while(temp->next != NULL)
    {
      if (temp->key == key)
	return temp;
      temp = temp->next;
    }
  //check last item in list
  if (temp->key == key)
    return temp;
  else
    return NULL;
}

int SortedList_length(SortedList_t *list)
{
  if (opt_yield & LOOKUP_YIELD)
    sched_yield();
  //invalid head ptr
  if (list == NULL)
    return -1;
  //empty list
 if (list->next == NULL)
    return 0;
 
  int count = 1;
  SortedListElement_t* temp = list->next;
  while (temp->next != NULL)
    {
      //check for invalid key orders
      if (temp->prev->key == NULL)
	;
      else if ( (strcmp(temp->prev->key, temp->key) > 0) ||
	  (strcmp(temp->key,temp->next->key) > 0) )
	return -1;
      count++;
      temp = temp->next;
    }
  //was only 1 element in list
  if (temp->prev->key == NULL)
    return 1;
  //got to end of longer list
  else if (temp->next == NULL)
    {
      if (strcmp(temp->prev->key,temp->key) > 0)
	return -1;
      else
	  count++;
    }
  return count;
}


  
