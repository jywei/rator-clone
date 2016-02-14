module ApplicationHelper
  def display_page_title
    if @page_title
      "#{@page_title} | Yourator職涯情報"
    else
      "讓求職視野更開闊 | Yourator職涯情報"
    end
  end

  def display_page_desc
    if @page_desc
      "#{@page_desc}"
    else
      "Yourator職涯情報結合社群與職場專欄帶給工作者有別於傳統人力銀行的求職體驗。透過徵才團隊成員的經驗分享，讓求職者在投遞履歷之前就了解企業文化，看見真實工作環境。Yourator協助新創團隊、社會企業與文創產業在徵才的同時能夠分享自己的理念與組織文化，幫助公司找到真正認同企業價值的優秀人才!"
    end
  end

  def display_page_keywords
    if @page_keywords
      "#{@page_keywords}"
    else
      "求職, 人力銀行, 104, 徵才, 找工作, 新創公司"
    end
  end

  def is_home?
    if current_page?(root_path)
      ""
    else
      "top-container"
    end
  end

  def is_fluid?
    if current_page?(root_path)
      ""
    else
      "container"
    end
  end
end
