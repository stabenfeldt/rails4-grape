$ ->

  $(document).on 'click', '.new_task_on_company', (e) ->
    company_id = $("#customer option:selected").val();
    this.href = "/customers/#{company_id}/tasks/new"
