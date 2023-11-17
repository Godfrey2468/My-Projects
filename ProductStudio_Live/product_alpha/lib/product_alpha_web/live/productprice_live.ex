defmodule ProductAlphaWeb.ProductpriceLive do
    use ProductAlphaWeb, :live_view

    def mount(_params, _session, socket) do
      ref_schema = schema("GER")

      {:ok, assign(socket, :ref_schema,  ref_schema)}
   end

    def handle_event("load-schema", %{"code" => code}, socket) do
       ko = Jason.encode!(schema(code))
     #  IO.inspect(ko)
      # #IO.inspect(get_policy(3))
      # ll = get_policy(3)
      # ll.data
    #  IO.inspect(schema(code))
      {:reply, %{schema: schema(code), prodprice: startprice()}, socket}
    end


    def handle_event("submit", params, socket) do
      ref_schema = socket.assigns.ref_schema
      IO.inspect(params)

      case ExJsonSchema.Validator.validate(ref_schema, params) do
        :ok ->

          {:noreply, put_flash(socket, :info, "Success!")}

        {:error, _errors} ->
          {:noreply, put_flash(socket, :error, "Errors!")}
      end
    end


    def startprice() do
      %{
          "Product Price" => [
            %{
              "Base price" => %{
                "billing_code" => "1300A010",
                "default_spend_limit" => 0,
                "default_text" => "4G mobile standard staff",
                "free_units" => 0,
                "gl_code" => "1300A010",
                "invoicing_mode" => "PRE_PAID",
                "post_surcharge" => 0
              },
              "Consumption billing" => %{
                "consumption period" => "3 months",
                "effective date" => "2023-05-25",
                "event charging" => %{
                  "applies_to" => %{
                    "balances" => ["data_sub", "data0", "primary_balance"],
                    "service_type" => "mobile_data"
                  },
                  "model" => "PRE-PAID",
                  "quota_calc" => "default",
                  "type" => %{"simple" => true, "time_band" => false}
                },
                "real-time charging specification" => %{
                  "billing_code" => "1300A010",
                  "default_spend_limit" => 0,
                  "default_text" => "4G mobile standard staff",
                  "free_units" => 0,
                  "gl_code" => "1300A010",
                  "invoicing_mode" => "PRE_PAID",
                  "post_surcharge" => 0
                },
                "value" => ""
              },
              "Discounts" => [
                %{"description" => "monthly top-up", "name" => "top-up", "percentage" => "10%"},
                %{
                  "description" => "discount is provided every season",
                  "name" => "seasonal discount",
                  "percentage" => "20%"
                }
              ],
              "Subscription billing" => [%{"amount" => "1000", "fee" => "1000", "status" => "subscribed"}],
              "additional wallet configuration" => [
                %{"sms0" => %{"available" => 0, "expiry" => nil, "rules" => [], "type" => "COUNTER"}},
                %{
                  "sms_sub" => [
                    %{
                      "amount_at_last_topup" => 50,
                      "available" => 50,
                      "expiry" => nil,
                      "rules" => %{
                        "auto_refill" => %{
                          "available" => 50,
                          "expiry" => "BILL_CYCLE_END",
                          "mode" => "OVERWRITE"
                        }
                      },
                      "trn" => [
                        %{
                          "amount" => 25,
                          "inserted_at" => "2022-12-01T00:00:01.000Z",
                          "name" => "4g_basic_50p-sms_sub",
                          "status" => "LOADED"
                        },
                        %{
                          "amount" => 10,
                          "inserted_at" => "2022-12-01T00:00:01.000Z",
                          "name" => "4g_basic_80p-sms_sub",
                          "status" => "LOADED"
                        },
                        %{
                          "amount" => 1,
                          "inserted_at" => "2022-12-01T00:00:01.000Z",
                          "name" => "4g_basic_100p-sms_sub",
                          "status" => "LOADED"
                        }
                      ],
                      "type" => "COUNTER"
                    }
                  ]
                },
                %{
                  "data0" => %{
                    "available" => 0,
                    "meta" => %{"expiry" => nil},
                    "rules" => [],
                    "type" => "COUNTER"
                  }
                },
                %{
                  "data_sub" => %{
                    "available" => 4294967296,
                    "meta" => %{
                      "amount_at_last_topup" => 4294967296,
                      "expiry" => nil,
                      "trn" => [
                        %{
                          "amount" => 2147483648,
                          "inserted_at" => "2022-12-01T00:00:01.000Z",
                          "name" => "4g_basic_50p-data_sub",
                          "status" => "LOADED"
                        },
                        %{
                          "amount" => 858993458,
                          "inserted_at" => "2022-12-01T00:00:01.000Z",
                          "name" => "4g_basic_80p-data_sub",
                          "status" => "LOADED"
                        },
                        %{
                          "amount" => 1310720,
                          "inserted_at" => "2022-12-01T00:00:01.000Z",
                          "name" => "4g_basic_100p-data_sub",
                          "status" => "LOADED"
                        }
                      ]
                    },
                    "rules" => [
                      %{
                        "auto_refill" => %{
                          "available" => 4294967296,
                          "expiry" => "BILL_CYCLE_END",
                          "mode" => "OVERWRITE"
                        }
                      }
                    ],
                    "type" => "COUNTER"
                  }
                },
                %{
                  "voice0" => %{
                    "available" => 0,
                    "meta" => %{"expiry" => nil},
                    "rules" => [],
                    "type" => "COUNTER"
                  }
                },
                %{
                  "voice_sub" => %{
                    "available" => 3600,
                    "meta" => %{
                      "amount_at_last_topup" => 3600,
                      "expiry" => nil,
                      "trn" => [
                        %{
                          "amount" => 1800,
                          "inserted_at" => "2022-12-01T00:00:01.000Z",
                          "name" => "4g_basic_50p-voice_sub",
                          "status" => "LOADED"
                        },
                        %{
                          "amount" => 720,
                          "inserted_at" => "2022-12-01T00:00:01.000Z",
                          "name" => "4g_basic_80p-voice_sub",
                          "status" => "LOADED"
                        },
                        %{
                          "amount" => 2,
                          "inserted_at" => "2022-12-01T00:00:01.000Z",
                          "name" => "4g_basic_100p-voice_sub",
                          "status" => "LOADED"
                        }
                      ]
                    },
                    "rules" => [
                      %{
                        "auto_refill" => %{
                          "available" => 3600,
                          "expiry" => "BILL_CYCLE_END",
                          "mode" => "OVERWRITE"
                        }
                      }
                    ],
                    "type" => "COUNTER"
                  }
                },
                %{
                  "free_data" => %{
                    "available" => 1099511627776,
                    "meta" => %{"expiry" => nil},
                    "rules" => [],
                    "type" => "COUNTER"
                  }
                }
              ]
            }
          ]


      }
    end
    defp schema("GER") do
    # You'd probably load the schema from either your database
    # or a JSON file, but we'll simply hard-code it for now:
      %{
        "type" => "object",
        "title" => "Inter-account ",
        "properties" => %{
          "Product Price" => %{
            "type" => "array",
            "items" => %{
              "properties" => %{
                "Base price" => %{
                  "properties" => %{
                    "billing_code" => %{"type" => "string"},
                    "default_spend_limit" => %{"type" => "integer"},
                    "default_text" => %{"type" => "string"},
                    "free_units" => %{"type" => "integer"},
                    "gl_code" => %{"type" => "string"},
                    "invoicing_mode" => %{"type" => "string"},
                    "post_surcharge" => %{"type" => "integer"}
                  },
                  "required" => ["gl_code", "free_units", "billing_code", "default_text", "invoicing_mode",
                   "post_surcharge", "default_spend_limit"],
                  "type" => "object"
                },
                "Consumption billing" => %{
                  "properties" => %{
                    "consumption period" => %{"type" => "string"},
                    "effective date" => %{"format" => "date", "type" => "string"},
                    "event charging" => %{
                      "properties" => %{
                        "applies_to" => %{
                          "properties" => %{
                            "balances" => %{"items" => %{"type" => "string"}, "type" => "array"},
                            "service_type" => %{"type" => "string"}
                          },
                          "required" => ["balances", "service_type"],
                          "type" => "object"
                        },
                        "model" => %{"type" => "string"},
                        "quota_calc" => %{"type" => "string"},
                        "type" => %{
                          "properties" => %{
                            "simple" => %{"type" => "boolean"},
                            "time_band" => %{"type" => "boolean"}
                          },
                          "required" => ["simple", "time_band"],
                          "type" => "object"
                        }
                      },
                      "required" => ["model", "quota_calc", "type", "applies_to"],
                      "type" => "object"
                    },
                    "real-time charging specification" => %{
                      "properties" => %{
                        "billing_code" => %{"type" => "string"},
                        "default_spend_limit" => %{"type" => "integer"},
                        "default_text" => %{"type" => "string"},
                        "free_units" => %{"type" => "integer"},
                        "gl_code" => %{"type" => "string"},
                        "invoicing_mode" => %{"type" => "string"},
                        "post_surcharge" => %{"type" => "integer"}
                      },
                      "required" => ["gl_code", "free_units", "billing_code", "default_text",
                       "invoicing_mode", "post_surcharge", "default_spend_limit"],
                      "type" => "object"
                    },
                    "value" => %{"type" => "string"}
                  },
                  "required" => ["consumption period", "effective date", "value", "event charging",
                   "real-time charging specification"],
                  "type" => "object"
                },
                "Discounts" => %{
                  "items" => %{
                    "properties" => %{
                      "description" => %{"type" => "string"},
                      "name" => %{"type" => "string"},
                      "percentage" => %{"type" => "string"}
                    },
                    "required" => ["name", "description", "percentage"],
                    "type" => "object"
                  },
                  "type" => "array"
                },
                "Subscription billing" => %{
                  "items" => %{
                    "properties" => %{
                      "amount" => %{"format" => "time", "type" => "string"},
                      "fee" => %{"format" => "time", "type" => "string"},
                      "status" => %{"type" => "string"}
                    },
                    "required" => ["fee", "amount", "status"],
                    "type" => "object"
                  },
                  "type" => "array"
                },
                "additional wallet configuration" => %{
                  "items" => %{
                    "properties" => %{
                      "data0" => %{
                        "properties" => %{
                          "available" => %{"type" => "integer"},
                          "meta" => %{
                            "properties" => %{"expiry" => %{"type" => "null"}},
                            "required" => ["expiry"],
                            "type" => "object"
                          },
                          "rules" => %{"items" => false, "type" => "array"},
                          "type" => %{"type" => "string"}
                        },
                        "required" => ["meta", "type", "rules", "available"],
                        "type" => "object"
                      },
                      "data_sub" => %{
                        "properties" => %{
                          "available" => %{"type" => "integer"},
                          "meta" => %{
                            "properties" => %{
                              "amount_at_last_topup" => %{"type" => "integer"},
                              "expiry" => %{"type" => "null"},
                              "trn" => %{
                                "items" => %{
                                  "properties" => %{
                                    "amount" => %{"type" => "integer"},
                                    "inserted_at" => %{"format" => "date-time", "type" => "string"},
                                    "name" => %{"type" => "string"},
                                    "status" => %{"type" => "string"}
                                  },
                                  "required" => ["name", "amount", "status", "inserted_at"],
                                  "type" => "object"
                                },
                                "type" => "array"
                              }
                            },
                            "required" => ["trn", "expiry", "amount_at_last_topup"],
                            "type" => "object"
                          },
                          "rules" => %{
                            "items" => %{
                              "properties" => %{
                                "auto_refill" => %{
                                  "properties" => %{
                                    "available" => %{"type" => "integer"},
                                    "expiry" => %{"type" => "string"},
                                    "mode" => %{"type" => "string"}
                                  },
                                  "required" => ["mode", "expiry", "available"],
                                  "type" => "object"
                                }
                              },
                              "required" => ["auto_refill"],
                              "type" => "object"
                            },
                            "type" => "array"
                          },
                          "type" => %{"type" => "string"}
                        },
                        "required" => ["meta", "type", "rules", "available"],
                        "type" => "object"
                      },
                      "free_data" => %{
                        "properties" => %{
                          "available" => %{"type" => "integer"},
                          "meta" => %{
                            "properties" => %{"expiry" => %{"type" => "null"}},
                            "required" => ["expiry"],
                            "type" => "object"
                          },
                          "rules" => %{"items" => false, "type" => "array"},
                          "type" => %{"type" => "string"}
                        },
                        "required" => ["meta", "type", "rules", "available"],
                        "type" => "object"
                      },
                      "sms0" => %{
                        "properties" => %{
                          "available" => %{"type" => "integer"},
                          "expiry" => %{"type" => "null"},
                          "rules" => %{"items" => false, "type" => "array"},
                          "type" => %{"type" => "string"}
                        },
                        "required" => ["expiry", "type", "rules", "available"],
                        "type" => "object"
                      },
                      "sms_sub" => %{
                        "items" => %{
                          "properties" => %{
                            "amount_at_last_topup" => %{"type" => "integer"},
                            "available" => %{"type" => "integer"},
                            "expiry" => %{"type" => "null"},
                            "rules" => %{
                              "properties" => %{
                                "auto_refill" => %{
                                  "properties" => %{
                                    "available" => %{"type" => "integer"},
                                    "expiry" => %{"type" => "string"},
                                    "mode" => %{"type" => "string"}
                                  },
                                  "required" => ["mode", "expiry", "available"],
                                  "type" => "object"
                                }
                              },
                              "required" => ["auto_refill"],
                              "type" => "object"
                            },
                            "trn" => %{
                              "items" => %{
                                "properties" => %{
                                  "amount" => %{"type" => "integer"},
                                  "inserted_at" => %{"format" => "date-time", "type" => "string"},
                                  "name" => %{"type" => "string"},
                                  "status" => %{"type" => "string"}
                                },
                                "required" => ["name", "amount", "status", "inserted_at"],
                                "type" => "object"
                              },
                              "type" => "array"
                            },
                            "type" => %{"type" => "string"}
                          },
                          "required" => ["trn", "expiry", "amount_at_last_topup", "type", "available",
                           "rules"],
                          "type" => "object"
                        },
                        "type" => "array"
                      },
                      "voice0" => %{
                        "properties" => %{
                          "available" => %{"type" => "integer"},
                          "meta" => %{
                            "properties" => %{"expiry" => %{"type" => "null"}},
                            "required" => ["expiry"],
                            "type" => "object"
                          },
                          "rules" => %{"items" => false, "type" => "array"},
                          "type" => %{"type" => "string"}
                        },
                        "required" => ["meta", "type", "rules", "available"],
                        "type" => "object"
                      },
                      "voice_sub" => %{
                        "properties" => %{
                          "available" => %{"type" => "integer"},
                          "meta" => %{
                            "properties" => %{
                              "amount_at_last_topup" => %{"type" => "integer"},
                              "expiry" => %{"type" => "null"},
                              "trn" => %{
                                "items" => %{
                                  "properties" => %{
                                    "amount" => %{"type" => "integer"},
                                    "inserted_at" => %{"format" => "date-time", "type" => "string"},
                                    "name" => %{"type" => "string"},
                                    "status" => %{"type" => "string"}
                                  },
                                  "required" => ["name", "amount", "status", "inserted_at"],
                                  "type" => "object"
                                },
                                "type" => "array"
                              }
                            },
                            "required" => ["trn", "expiry", "amount_at_last_topup"],
                            "type" => "object"
                          },
                          "rules" => %{
                            "items" => %{
                              "properties" => %{
                                "auto_refill" => %{
                                  "properties" => %{
                                    "available" => %{"type" => "integer"},
                                    "expiry" => %{"type" => "string"},
                                    "mode" => %{"type" => "string"}
                                  },
                                  "required" => ["mode", "expiry", "available"],
                                  "type" => "object"
                                }
                              },
                              "required" => ["auto_refill"],
                              "type" => "object"
                            },
                            "type" => "array"
                          },
                          "type" => %{"type" => "string"}
                        },
                        "required" => ["meta", "type", "rules", "available"],
                        "type" => "object"
                      }
                    },
                    "type" => "object"
                  },
                  "type" => "array"
                }
              },
              "required" => ["additional wallet configuration", "Base price", "Subscription billing",
               "Discounts", "Consumption billing"],
              "type" => "object"
            }
          }


        }


  }



  end





end
