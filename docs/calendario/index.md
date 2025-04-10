---
#title:
#icon:
description: Veja quando acontecerá os próximos boosts de gold, exp, rep, no Adventure Quest Worlds.
authors:
  - pen
date: 2025-04-08
keywords:
    - aqw calendario de eventos
    - aqw quando tem boost de rep
    - aqw quando tem boost de exp
    - aqw quando tem boost de gold
    - aqw quando tem boost de class point (cp)
tags:
social_share: true
hide:
 - toc
 - navigation
---
# Calendário
---

!!! tip "Dica"
    Veja os links à esquerda da página ou clique em :fontawesome-solid-bars: (canto superior esquerdo).

<div id='calendar'></div>

<script>
  document.addEventListener('DOMContentLoaded', function () {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
                    initialView: 'listWeek',
                    locale: 'pt',
                    headerToolbar: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'dayGridMonth,listWeek,timeGridDay'
                    },
                    views: {
                        listWeek: {
                            buttonText: 'Lista'
                        },
                        dayGridMonth: {
                            buttonText: 'Mês'
                        },
                        timeGridDay: {
                            buttonText: 'Dia'
                        }
                    },                    
                    fixedWeekCount: false,
                    contentHeight: 'auto',
                    editable: false,
                    eventLimit: true,
                    eventSources: [
                      {
                        url: 'assets/calendar/aqw.json',
                        failure: () => alert('Falha ao carregar aqw.json')
                      }
                    ]
    });
    calendar.render();
  });
</script>